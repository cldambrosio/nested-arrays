require 'spec_helper'

RSpec.describe do

  describe "substitutions_num for two arrays of nested strings" do
    it "returns -1 if the levels of nesting do not match" do
      array1 = ["I", ["love"], [["awesome"]], "drones"]
      array2 = ["I", ["love"], [[["awesome"]]], "drones"]
      expect(substitutions_num(array1, array2)).to eq -1
    end
    it "returns -1 if the lengths of the strings do not match" do
      array3 = ["I", ["love"], [[["awesome"]]], "drones"]
      array4 = ["I", ["adore"], [[["red"]]], "drones"]
      expect(substitutions_num(array3, array4)).to eq -1
    end
    it "returns 0 if no character needs to be substituted" do
      array = ["I", ["love"], [[["awesome", "shiny"]]], "drones"]
      expect(substitutions_num(array, array)).to eq 0
    end
    it "returns the number of unidentical characters in a word" do
      array5 = ["shiny"]
      array6 = ["dirty"]
      expect(substitutions_num(array5, array6)).to eq 4
    end
    it "multiplies by 2 if a string is nested in an array" do
      array7 = [ ["shiny"] ]
      array8 = [ ["dirty"] ]
      expect(substitutions_num(array7, array8)).to eq 8
    end
    it "multiplies 2 to the power of the depth of nesting" do
      array9 = [ [[["drones"]]] ]
      array10 = [ [[["drains"]]] ]
      expect(substitutions_num(array9, array10)).to eq 24
    end
    it "returns the sum of the number of necessary one character 
    substitutions multiplied by 2 to the power of the depth of nesting 
    at which substitution must occur" do
      array1 = ["I", ["love"], [[["awesome", "shiny"]]], "drones"]
      array2 = ["I", ["hate"], [[["magenta", "dirty"]]], "drains"]
      expect(substitutions_num(array1, array2)).to eq 97
    end
  end

end