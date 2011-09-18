require 'test_helper'

class EmploymentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Employment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Employment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Employment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to employment_url(assigns(:employment))
  end

  def test_edit
    get :edit, :id => Employment.first
    assert_template 'edit'
  end

  def test_update_invalid
    Employment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Employment.first
    assert_template 'edit'
  end

  def test_update_valid
    Employment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Employment.first
    assert_redirected_to employment_url(assigns(:employment))
  end

  def test_destroy
    employment = Employment.first
    delete :destroy, :id => employment
    assert_redirected_to employments_url
    assert !Employment.exists?(employment.id)
  end
end
