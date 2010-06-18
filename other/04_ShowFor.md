!SLIDE

# Show For

!SLIDE

# SimpleForm позаботился о new и edit

!SLIDE

# а index и show тихо плачут в углу

!SLIDE

## Show For спешит на помощь

    @@@ ruby
    = show_for @meeting do |meeting|
      = m.attribute   :title
      = m.attribute   :date, :format => :short
      = m.attribute   :description, :if_blank => 'Пока не добавили'
      = m.association :presenters, :to_sentence => true
      = m.attribute   :published?

!SLIDE

## Здесь будет html

!SLIDE

+ Labels
+ Отображение значений с учетом типа (string, boolean, date, array, hash, proc!)
+ Значения по умолчанию
+ Ассоциации
+ I18N
+ Настройка всего
+ Шаблон для scaffold




