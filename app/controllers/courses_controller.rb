 class CoursesController < ApplicationController
   def show
    @course = Course.find_by id: params[:id]
   end
 end
