# frozen_string_literal: true

module Admin
  class TutorialsController < BaseController
    def edit
      @tutorial = Tutorial.find(params[:id])
    end

    def update
      tutorial = Tutorial.find(params[:id])
      if tutorial.update(tutorial_params)
        flash[:success] = "#{tutorial.title} tagged!"
      end
      redirect_to edit_admin_tutorial_path(tutorial)
    end

    private

    def tutorial_params
      params.require(:tutorial).permit(:tag_list)
    end
  end
end
