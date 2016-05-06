module JobsHelper
  def icon_by_category(category, size = "2x")
    case category
    when "Desenvolvimento"
      fa_icon "code #{size}"
    when "Design"
      fa_icon "paint-brush #{size}"
    when "Marketing"
      fa_icon "line-chart #{size}"
    when "Social Media"
      fa_icon "share-square #{size}"
    when "Business/Executivo"
      fa_icon "briefcase #{size}"
    when "Operações"
      fa_icon "gears #{size}"
    when "Relacionamento com o cliente"
      fa_icon "comments-o #{size}"
    when "Suporte"
      fa_icon "group #{size}"
    when "Comercial"
      fa_icon "money #{size}"
    when "Diversos"
      fa_icon "asterisk #{size}"
    when "Audiovisual e Fotografia"
      fa_icon "camera #{size}"
    end
  end
end
