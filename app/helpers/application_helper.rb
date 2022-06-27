module ApplicationHelper
  #Dateを曜日を含む日本語に変換
  def date_to_japanese(date, include_year)
    jp_weekday = %w[日 月 火 水 木 金 土]
    include_year ? date.strftime("%Y/%m/%d (#{jp_weekday[date.wday]})") : date.strftime("%m/%d (#{jp_weekday[date.wday]})")
  end
end
