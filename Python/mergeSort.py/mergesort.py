def mergeSort(array: list):
    middle = len(array)//2

    if len(array) == 1:
        return arr
    
    left = array[:middle]
    right = array[middle:]

    mergeSort(left)
    mergeSort(right)

    return merge(left, right)

def merge(left: list, right: list):
    i = 0
    j = 0
    k = 0

    array = [None] * (len(left) + len(right))

    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            array[k] = left[i]
            i += 1
        else:
            array[k] = right[j]
            j += 1
        k += 1

    while i < len(left):
        array[k] = left[i]
        i += 1
        k += 1

    while j < len(right):
        array[k] = right[j]
        j += 1
        k += 1
    return array


if __name__ == "__main__":
    arr = [12, 11, 13, 5, 6, 7]
    sorted = mergeSort(arr)
    print("Sorted array is:", sorted)
