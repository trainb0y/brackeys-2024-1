extends Node
 
# I know these are bad
# shut up
# go away
# it's the last day of the jam
# I'm too lazy to try to make something better

# could also cache these and only recalc on scene change
# that's effort though

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
