module JobsHelper

  def icon_by_category(category)
    case category
    when 'Desenvolvimento'
      fa_icon 'code 2x'
    when 'Design'
      fa_icon 'paint-brush 2x'
    when 'Marketing'
      fa_icon 'line-chart 2x'
    when 'Social Media'
      fa_icon 'share-square 2x'
    when 'Business/Executivo'
      fa_icon 'briefcase 2x'
    when 'Operações'
      fa_icon 'gears 2x'
    when 'Relacionamento com o cliente'
      fa_icon 'comments-o 2x'
    when 'Suporte'
      fa_icon 'group 2x'
    when 'Comercial'
      fa_icon 'money'
    when 'Diversos'
      fa_icon 'asterisk'
    end
  end
end
