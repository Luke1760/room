require "rails_helper"

RSpec.describe CoursesController do
  describe "#index" do
    it "assigns @courses" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do 
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(response).to render_template("index")
    end
  end

  describe "#show" do 
    it "assigns @course" do
      course = create(:course)

      get :show, params: {id: course.id}

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)

      get :show, params: {id: course.id}

      expect(response).to render_template("show")
    end
  end

  describe "#new" do
    it "assigns @course" do
      course = build(:course)
      # course = Course.new 也可

      get :new

      expect(assigns[:course]).to be_a_new(Course)
    end

    it "render template" do
      course = build(:course)
      # course = Course.new 也可

      get :new

      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    it "can't create a new record when course title is blank" do 
      expect do 
        post :create, params: { course: { :description => "bar"}}
      end.to change { Course.count }.by(0)
    end

    it "render new template when course title is blank" do
      post :create, params: { course: { :description => "bar"}}

      expect(response).to render_template("new")
    end

    it "create a new course record when course title is exist" do
      course = build(:course)

      expect do
        post :create, params: {course: attributes_for(:course) }
      end.to change { Course.count }.by(1)
    end

    it "redirect_to courses_path when course title is exist" do
      post :create, params: { course: attributes_for(:course) }

      expect(response).to redirect_to courses_path
    end
  end
end
