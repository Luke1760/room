require "rails_helper"

RSpec.describe CoursesController do
  describe "GET index" do
    it "assigns @courses" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
    end

  describe "GET show" do
    it "assigns @course" do
      course = create(:course)

      get :show, params: { id: course.id}

      expect(assigns[:course]).to eq(course)
    end
  end

  describe "GET new" do
    it "assign @course" do
      course = build(:course)

      get :new

      expect(assigns(:course)).to be_a_new(Course)
    end
  end

    it "render template" do
      course1 = create(:course)
      course2 = create(:course)
      course = create(:course)
      course = build(:course)
      
      # get :index
      # get :show, params: {id: course.id}
      get :new
      

      # expect(response).to render_template("index")
      # expect(response).to render_template("show")
      expect(response).to render_template("new")
    end
  end
end
