class Spec < ActiveRecord::Base
  belongs_to :user

  ALL_FIELDS = %w(first_name last_name occupation gender birthdate
                  city state zip_code)
  STRING_FIELDS = %w(first_name last_name occupation city state)
  VALID_GENDERS = ["Male", "Female"]
  START_YEAR = 1900
  VALID_DATES = DateTime.new(START_YEAR)..DateTime.now
  ZIP_CODE_LENGTH = 5

  validates_length_of STRING_FIELDS,
                      :maximum => DB_STRING_MAX_LENGTH

  validates_inclusion_of :gender,
                         :in => VALID_GENDERS,
                         :allow_nil => true,
                         :message => "must be male or female"

  validates_inclusion_of :birthdate,
                         :in => VALID_DATES,
                         :allow_nil => true,
                         :message => "is invalid"

  validates_format_of :zip_code, :with => /(^$|^[0-9]{#{ZIP_CODE_LENGTH}}$)/,
                      :message => "must be a five digit number"

  # Return the full name (first plus last)
  def full_name
    [first_name, last_name].join(" ")
  end

  # Return a sensibly formatted location string.
  def location
    [city, state, zip_code].join(" ")
  end

  # Return the age using the birthdate.
  def age
    return if birthdate.nil?
    today = Date.today
    if today.month >= birthdate.month and today.day >= birthdate.day
      # Birthday has happened already this year.
      today.year - birthdate.year
    else
      today.year - birthdate.year - 1
    end
  end
end
