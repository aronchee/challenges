# Place your solutions here

# def binary_search(num,nums)
# 	nums.sort
# 	low = 0
# 	high = nums.length-1
# 	mid = (low+high)/2

# 		if num == nums[mid]
# 			low = low
# 			high = high
# 		elsif num < nums[mid]
# 			high == mid
# 			mid = (low+high)/2
			
# 		elsif num > nums[mid]
# 			low == mid
# 			mid = (low+high)/2
			
# 		else
# 			return -1
# 		end
# end

def binary_search(key,array)
	low = 0
	high = array.sort.length - 1
	return -1 if low>high
	mid = (low+high)/2
	return mid if array[mid]==key
		if array[mid]>key
			high=mid-1
			mid=(low+high)/2
		else
			low=mid+1
			mid=(low+high)/2
		end
end

# def binary_search(object, array, upper, lower = 0)
#     mid = (lower + upper) / 2
#     return nil if array[mid] == nil || lower > upper # Prevent stack overflow, returns nil if object not in array
#     object < array[mid] ? upper =  mid - 1 : lower = mid + 1
#     object == array[mid] ? mid : binary_search(object, array, upper, lower)
# end

array = [1,2,3,4,5,6,7,8,9,10,11]
puts binary_search(6,array)