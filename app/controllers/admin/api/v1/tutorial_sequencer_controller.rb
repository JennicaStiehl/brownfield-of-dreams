# frozen_string_literal: true

module Admin
  module Api
    module V1
      class TutorialSequencerController < BaseController
        def update
          tutorial = Tutorial.find(params[:tutorial_id])
          TutorialSequencer.new(tutorial, ordered_video_ids).run!

          render json: tutorial
        end

        private

        def ordered_video_ids
          params[:tutorial_sequencer][:_json]
        end
      end
    end
  end
end
