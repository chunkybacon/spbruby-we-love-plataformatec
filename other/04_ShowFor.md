!SLIDE

# Show For

!SLIDE

# SimpleForm позаботился о new и edit

!SLIDE center

# а index и show тихо плачут в углу

![Дети рыдают](kids-crying.jpg)

!SLIDE center

# José вновь спешит на помощь!

![SuperJose](super_jose.jpg)

!SLIDE

## Никакого грязного HTML!

    @@@ ruby
    = show_for @meeting do |meeting|
      = m.attribute   :title
      = m.attribute   :date, :format => :short
      = m.attribute   :description, :if_blank => 'Пока не добавили'
      = m.association :presenters, :to_sentence => true
      = m.attribute   :published?

!SLIDE

## То есть html конечно есть...

    @@@ html
    <div class="show_for meeting" id="meeting_1">
      <p class="wrapper meeting_title">Заголовок</p>
      <p class="wrapper meeting_description">
        <strong class="label">Описание</strong><br />
        ...
      </p>
      <p class="wrapper meeting_date">
        <strong class="label">Дата</strong><br />
        18 июня
      </p>
      <p class="wrapper meeting_presenters">
        <strong class="label">Выступающие</strong><br />
        Денис Лифанов, Максим Филатов и Евгений Большаков
      </p>
    </div>

!SLIDE bullets incremental smaller

* Labels
* Отображение значений с учетом типа (string, boolean, date, array, hash, proc!)
* Значения по умолчанию
* Ассоциации
* I18N
* Настройка всего
+ Шаблон для scaffold
