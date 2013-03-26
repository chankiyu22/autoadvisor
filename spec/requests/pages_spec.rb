require 'spec_helper'

describe "Pages" do

 describe "Home page" do

    it "should have the title 'Home'" do
      visit '/pages/home'
      page.should have_selector('title',text: "AutoAdvisor")
    end
  end

 describe "Documentation Page" do

    it "should have the h1 'Documentation'" do
      visit '/pages/documentation'
      page.should have_selector('h1', text: 'Documentation')
    end

    it "should have the title 'Documentation'" do
      visit '/pages/documentation'
      page.should have_selector('title',text: "AutoAdvisor | Documentation")
    end
  end

  
  describe "About page" do

    it "should have the h1 'About'" do
      visit '/pages/about'
      page.should have_selector('h1', text: 'About')
    end

    it "should have the title 'About'" do
      visit '/pages/about'
      page.should have_selector('title',text: "AutoAdvisor | About")
    end
  end
end
