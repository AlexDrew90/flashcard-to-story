class StoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def create
    # Extract the data from the params hash.
    file = params[:file]
    format = params[:format]
    flashcard_type = params[:flashcard_type]
    language = params[:language]
    level = params[:level]
    story_length = params[:story_length]
    topic = params[:topic]

    # Parse the file and generate a prompt.
    prompt = generate_prompt(file, format, flashcard_type, language, level, story_length, topic)

    # Use the GPT API to generate a story from the prompt.
    story_text = generate_story(prompt)

    # If the user is logged in, save the story to the database.
    if user_signed_in?
      current_user.stories.create(text: story_text)
    end

    # Render the story text in a view.
    render 'show', locals: { story: story_text }
  end
end
