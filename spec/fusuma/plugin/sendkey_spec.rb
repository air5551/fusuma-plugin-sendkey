# frozen_string_literal: true

module Fusuma
  module Plugin
    RSpec.describe Sendkey do
      it "has a version number" do
        expect(Fusuma::Plugin::Sendkey::VERSION).not_to be nil
      end
    end
  end
end
