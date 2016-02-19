
class Algo
  def number_frequency(x)
    h = Hash.new
    x.each { |i| h[i] = h[i].to_i + 1 }
    h
  end

  def gcd(x, y)
    if y >= x && y % x == 0
      x
    elsif x > y
      gcd(y, x)
    else
      gcd(x, y % x)
    end
  end

  def ngcd(x, y)
    while y != 0 do
      z = x % y
      x = y
      y = z
    end

    x
  end

  def sorted?(array)
    for i in 0..(array.size - 2)
      unless array[i] < array[i+1]
        return false
      end
    end

    true
  end

  def ackermann(m, n)
    if m.zero?
      n + 1
    elsif m > 0 && n.zero?
      ackermann(m - 1, 1)
    elsif m > 0 && n > 0
      ackermann(m - 1, ackermann(m, n-1))
    end
  end

  def binary_search(array, value, beg = 0, last = array.size - 1 )
    return -1 if beg > last

    mid = (beg + last) / 2

    if value < array[mid]
      binary_search(array, value, beg, mid - 1)
    elsif value > array[mid]
      binary_search(array, value, mid + 1, last)
    else
      mid
    end
  end

  # Iterative

  def iterative_binary_search(array, value, beg = 0)
    return -1 unless sorted? array

    last = array.size - 1

    while(beg <= last) do
      mid = (beg + last) / 2

      if value < array[mid]
        last = mid - 1
      elsif value > array[mid]
        beg = mid + 1
      else
        return mid
      end
    end
  end

  ##  Problem number 6

  def compute_binary_numbers(n)
    count, i = 1, 1

    while i >= 0 do
      binary_number = binary_of(i)

      if binary_number.length > n
        return count
      end

      count = count + 1 unless check_consecutive_ones?(binary_number)
      i = i + 1
    end
  end

  def check_consecutive_ones?(str)
    arr = str.split("")
    flag = false

    arr.each_with_index do |i, index|
      if arr[index].to_i == 1 && arr[index] == arr[index + 1]
        flag = true
        break
      end
    end

    flag
  end

  def binary_of(m)
    o = []

    while m >= 1 do
      o << m % 2
      break if m == 1
      m = m / 2
    end

    o.reverse.join
  end
end
