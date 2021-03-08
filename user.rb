require_relative 'main.rb'      # подключение файла описания класса

a1 = '04.07.2020'       # paid_till
b1 = '20.02'            # max_version
c1 = '19.01'            # min_version

l1 = License.new(a1, b1, c1)    # создание первого объекта
p l1.list_create                # вызов метода list_create для созданного объекта
                                # и вывод результата в консоль

a2 = '04.07.2020'       # paid_till
b2 = nil                # max_version
c2 = nil                # min_version

l2 = License.new(a2, b2, c2)    # создание второго объекта
p l2.list_create                # вызов метода list_create для созданного объекта
                                # и вывод результата в консоль