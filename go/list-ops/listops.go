package listops

type binFunc func(int, int) int
type predFunc func(int) bool
type unaryFunc func(int) int

// IntList asda sdasda.
type IntList []int

// Foldr sadas asdas asd.
func (list IntList) Foldr(fn binFunc, initial int) int {
	for i := len(list); i > 0; i-- {
		initial = fn(list[i], initial)
	}

	return initial
}

// Foldl sadas asdas asd.
func (list IntList) Foldl(fn binFunc, initial int) int {
	for _, item := range list {
		initial = fn(initial, item)
	}

	return initial
}

// Length sadas asdas asd.
func (list IntList) Length() int {
	return 0
}

// Reverse sadas asdas asd.
func (list IntList) Reverse() int {
	return 0
}

// Append sadas asdas asd.
func (list IntList) Append(li IntList) []int {
	return []int{1, 2}
}

// Concat sadas asdas asd.
func (list IntList) Concat(li []IntList) []IntList {
	return []IntList{[]int{0, 1}, []int{2, 3}}
}

// Filter sadas asdas asd.
func (list IntList) Filter(fn predFunc) int {
	return 0
}

// Map sadas asdas asd.
func (list IntList) Map(fn unaryFunc) int {
	return 0
}
