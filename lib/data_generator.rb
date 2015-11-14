class DataGenerator

  def self.report(num = 1)
    reports = {}
    (0...num).each do
      report = { 
                :physician => physician, 
                :location => location, 
                :date => time_rand,
                :data => many_data
              }
      reports[lab_test] = report
    end
    return reports
  end

  private

    def self.lab_test
      lab_tests = [ "Hgb A1C", 
                    "Urinalysis", 
                    "Complete Blood Count",
                    "Lead, Hair",
                    "Leukotriene E4, Urine",
                    "Liver Fibrosis, Fibro Test-ActiTest Panel",
                    "Thallium, Blood",
                    "Diabetes Mellitus Type 1 Evaluation",
                    "PAP-SMEAR",
                    "Pregnancy Test",
                    "Fecalysis",
                    "Chest X-ray",
                    "Comprehensive Metabolic Panel",
                    "Thyroid Stimulating Hormone (TSH)",
                    "Fasting Glucose"]
      return lab_tests.sample
    end

    def self.physician
      doctors =  [ "William Hartnell",
                  "Patrick Throughton",
                  "Jon Pertwee",
                  "Tom Baker",
                  "Peter Davison",
                  "Colin Baker",
                  "Sylvester McCoy",
                  "Paul McGann",
                  "Christopher Eccleston",
                  "David Tennant",
                  "Matt Smith",
                  "Peter Capaldi",
                  "John Hurt",
                  "Hannibal Lecter",
                  "Hank McCoy",
                  "Doggie Howser",
                  "Beverly Crusher" ].sample
    end

    def self.location
      places =  [ "Chong Hua",
                  "Medical City",
                  "Prime Care",
                  "Alviar Biomedical Lab",
                  "Sunrise Medical Laboratories",
                  "St. Luke's"].sample
    end

    def self.time_rand from = 0.0, to = Time.now
      Time.at(from + rand * (to.to_f - from.to_f)).strftime("%Y-%m-%d")
    end

    def self.many_data
      data_hash = {}
      (1..rand(1..20)).each do 
        data_hash[data_name] = data
      end
      return data_hash
    end

    def self.data_name
      name = ["Color", "Appearance",
              "Specific Gravity",
              "pH", "Leucocytes",
              "Blood", "Nitrite",
              "Protein", "Glucose",
              "Ketones", "Urobilinogen",
              "White Blood Cell Count",
              "Red Blood Cell Count",
              "Ephithelial Cell Count",
              "Bacteria", "Hemoglobin",
              "Red Cell Count",
              "HCT", "MCV", "MCH",
              "MCHC", "RDW-CV",
              "White Cell Count",
              "Netrophils",
              "Lyphocytes",
              "Monocytes",
              "Eosinophils",
              "Basophils",
              "Platelet Count"].sample
    end

    def self.data
      units = ["", "/uL", "10^12/L", "%", "g/L", "pg", "fL"]
      
      data = {}

      # data[name] = {}

      case rand(2)
      when 0
        data[:value] = ["Positive", "Negative"].sample
      when 1
        value_min = [0, rand*rand(10)].sample
        value_max = value_min == 0 ? 0.1 : value_min + rand*rand(10)
        data[:value] = "%.4f" % rand(value_min..1.5*value_max)
  
        case rand(2)
        when 0
          data[:unit] = units.sample
        end

        case rand(2)
        when 0
          data[:normal_range] = "%.4f - %.4f" % [value_min, value_max]
        end
      end

      return data

    end
end