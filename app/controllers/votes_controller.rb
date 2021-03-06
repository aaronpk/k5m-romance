class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  # def index
  #   authenticate
  #   @votes = Vote.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @votes }
  #   end
  # end

  # GET /votes/1
  # GET /votes/1.json
  # def show
  #   authenticate
  #   @vote = Vote.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @vote }
  #   end
  # end

  # GET /votes/new
  # GET /votes/new.json
  # def new
  #   authenticate
  #   @vote = Vote.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @vote }
  #   end
  # end

  # # GET /votes/1/edit
  # def edit
  #   authenticate
  #   @vote = Vote.find(params[:id])
  # end

  # POST /votes
  # POST /votes.json
  def create
    authenticate

    value = (params[:vote_value] == "yes" ? 1 : 0)

    # First check if this user has already voted
    vote = Vote.where(:candidate_id => params[:vote][:candidate_id], :shareholder_id => @current_user.id)
    if vote.exists?
      @vote = vote[0]
      @vote.value = value
    else
      @vote = Vote.new(params[:vote])
      @vote.value = value
      @vote.shareholder = @current_user
    end

    VoteHistory.create({
      :value => value,
      :candidate_text => @vote.candidate.text,
      :candidate_id => params[:vote][:candidate_id], 
      :shareholder_id => @current_user.id
    })

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: {candidate_id: @vote.candidate.id, vote: @vote.candidate.vote_summary}, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PUT /votes/1
  # # PUT /votes/1.json
  # def update
  #   authenticate
  #   @vote = Vote.find(params[:id])

  #   respond_to do |format|
  #     if @vote.update_attributes(params[:vote])
  #       format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @vote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /votes/1
  # DELETE /votes/1.json
  # def destroy
  #   authenticate
  #   @vote = Vote.find(params[:id])
  #   @vote.destroy

  #   respond_to do |format|
  #     format.html { redirect_to votes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
