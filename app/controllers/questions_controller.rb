class QuestionsController < ApplicationController

  # POST /questions
  # POST /questions.json
  def create
    authenticate

    @question = Question.new(params[:question])
    @question.shareholder = @current_user
    puts @current_user.inspect
    puts @question.inspect
    @candidate = @question.candidate

    respond_to do |format|
      if @question.save
        format.html { redirect_to @candidate, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # I'm guessing this is boilerplate controller stuff, 
  # we don't want users updating/creating these records
  # -aaronpk

  # GET /questions
  # GET /questions.json
  # def index
  #   @questions = Question.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @questions }
  #   end
  # end

  # GET /questions/1
  # GET /questions/1.json
  # def show
  #   @question = Question.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @question }
  #   end
  # end

  # GET /questions/new
  # GET /questions/new.json
  # def new
  #   authenticate

  #   @question = Question.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @question }
  #   end
  # end

  # GET /questions/1/edit
  # def edit
  #   @question = Question.find(params[:id])
  # end

  # PUT /questions/1
  # PUT /questions/1.json
  # def update
  #   @question = Question.find(params[:id])

  #   respond_to do |format|
  #     if @question.update_attributes(params[:question])
  #       format.html { redirect_to @question, notice: 'Question was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /questions/1
  # # DELETE /questions/1.json
  # def destroy
  #   @question = Question.find(params[:id])
  #   @question.destroy

  #   respond_to do |format|
  #     format.html { redirect_to questions_url }
  #     format.json { head :no_content }
  #   end
  # end
end
