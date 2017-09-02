module UsersHelper
  def registration_error?
    resource.errors.full_messages.any?
  end

  # TODO: Use I18n
  def registration_error_message
    resource.errors.full_messages.map do |ref|
      {
        "Firstname can't be blank" => "姓氏未填",
        "Lastname can't be blank" => "名字未填",
        "Email can't be blank" => "Email未填",
        "Password can't be blank" => "密碼未填",
        "Password is too short (minimum is 6 characters)" => "密碼少於6字元",
        "Password confirmation doesn't match Password" => "密碼確認不符"
      }[ref]
    end.compact.join("、")
  end
end
