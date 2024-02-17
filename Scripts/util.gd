extends Node
 
# yes
# yes
# yes
# I know these are bad
# shut up
# go away


func get_player() -> Player:
	var p = []
	pain(get_tree().root, p)
	for node in p:
		if node is Player: return node
	return null
	
func get_transition() -> Transition:
	var p = []
	pain(get_tree().root, p)
	for node in p:
		if node is Transition: return node
	return null
	
func pain(n: Node, a: Array):
	a.append(n)
	for c in n.get_children():
		pain(c, a)
