FUNCTION switch_Byte~& (ln)
tb~& = (ln AND &HFF000000~&) \ (2 ^ 24)
mtb~& = (ln AND &H00FF0000~&) \ (2 ^ 8)
btb~& = (ln AND &H0000FF00~&) * (2 ^ 8)
bt~& = (ln AND &H000000FF~&) * (2 ^ 24)
switch_Byte~& = tb~& + mtb~& + btb~& + bt~&
END FUNCTION