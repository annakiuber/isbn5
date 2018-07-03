
def sandbox(num)
    b = [7,4,2,9,5,38,91]
    reverseevenarray1 = []
    finalarray = []
    array2 = []
    b.each_slice(2) { |x| reverseevenarray1.push(x[1]) }
        p "this is reverseevenarray1 #{reverseevenarray1} "






    b.each_slice(2) { |x| array2.push(x[0]) }
        p "this is array 2 #{array2} "

# array1 = array1.each { |i|
#     ary1[i] = ary1[i] * 10

end



 p sandbox(1234567)
