require 'date'  # подключение библиотеки класса Date для работы с датами

class FlussonicLastVersion

    @LastVersion = Date.strptime('20.10', '%y.%m')  # первый аргумент функции - дата последнего релиза

    # метод FlussonicLastVersion.get возвращает версию последнего релиза Флюссоника
    def self.get            
        @LastVersion
    end

end

class License   # модель лицензия

    def initialize(paid_till, max_version, min_version) # метод инициализации

        # если какое-либо поле nil, то присвоить ему значение, 
        # не ограничивающее выполнение дальнейших условий

        paid_till = '50.12' if paid_till.nil?       
        # преобразование формата dd.mm.yyyy в yy.mm
        @paid_till = Date.strptime(paid_till, '%d.%m.%Y').strftime('%y.%m')
        # определение строки как даты
        @paid_till = Date.strptime(@paid_till, '%y.%m') 

        max_version = '50.12' if max_version.nil?
        @max_version = Date.strptime(max_version, '%y.%m')

        min_version = '00.01' if min_version.nil?
        @min_version = Date.strptime(min_version, '%y.%m')

    end

    def list_create     # метод формирования списка доступных версий

        @AvailableVersions = []     #список доступных версий

        # берутся пять последних релизов Флюссоника
        @AvailableVersions[0] = FlussonicLastVersion.get
        4.times do |i| 
            @AvailableVersions[i+1] = @AvailableVersions[i].prev_month
        end

        # reverse, чтобы даты шли по возрастанию
        # reject для удаления неподходящих под условия версий
        @AvailableVersions.reverse!.reject! { |i| i > @max_version || i < @min_version || i > @paid_till }

        # если после примененных выше правил получился пустой массив, 
        # то берется максимально доступная версия без учета пяти последних релизов.
        @AvailableVersions[0] = @max_version if @AvailableVersions == []

        # форматирование дат
        @AvailableVersions.map! { |i| i.strftime('%y.%m')}

    end

end