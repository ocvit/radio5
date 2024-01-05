# frozen_string_literal: true

require "spec_helper"

RSpec.describe Radio5::Utils do
  describe "#parse_asset_url" do
    let(:key) { :icon }

    subject { described_class.parse_asset_url(hash, key) }

    context "when asset node exists" do
      context "when asset fields are present" do
        let(:hash) {
          {
            icon: {
              path: "island/icon/",
              filename: "6a28dc59-0699-452c-a7ae-93f59ce32cf7.png"
            },
            other_field: 123
          }
        }

        it "returns asset URL" do
          expect(subject).to eq "https://asset.radiooooo.com/island/icon/6a28dc59-0699-452c-a7ae-93f59ce32cf7.png"
        end
      end

      context "when some of the asset fields are missing" do
        let(:hash) {
          {
            icon: {
              path: "island/icon/",
              filepath: "6a28dc59-0699-452c-a7ae-93f59ce32cf7.png"
            },
            other_field: 123
          }
        }

        it "raises an error" do
          expect { subject }.to raise_error(KeyError, "key not found: :filename")
        end
      end
    end

    context "when asset node does not exist" do
      let(:hash) {
        {
          other_field: 123
        }
      }

      it "returns nil" do
        expect(subject).to be_nil
      end
    end
  end
end