subroutine print_tomato(t)
  implicit none
  integer :: t
  print*,achar(27)//'[32m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⣶⡆⠀⠿⠀⣶⠒⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣴⠾⠛⢹⣶⡤⢶⣿⡟⠶⠦⠄'//achar(27)//'[0m'
  print*,achar(27)//'[31m⠀⠀⠀⠀⠀⣠⣶⣤⣤⣤⣤⣴⠂'//achar(27)//'[0m'&
       //achar(27)//'[32m⠸⠋    ⠓'//achar(27)//'[0m' &
       //achar(27)//'[31m⠲⣶⣾⣿⣷⣄⠀⠀⠀⠀'
  print*,'⠀⠀⠀⢀⣾⡿⠋⠁⣠⣤⣿⡟⢀⣠⣾⣿⣿⣿⣷⣶⣤⣼⣿⣿⣿⣿⣆⠀⠀⠀'
  print*,'⠀⠀⠀⣾⡟⠀⣰⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀'
  print*,'⠀⠀⢸⡿⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀'
  print*,'⠀⠀⢸⡇⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀'
  print*,'⠀⠀⢸⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀'
  print*,'⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀'
  print*,'⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠀⠀⠉⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀'
  print*,'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀' //achar(27)//'[0m'
end subroutine print_tomato !this is ugly

subroutine timer(x)
  implicit none
  integer :: x, xx
  xx = x
  do while (xx .ne. 0)
     xx = xx - 1
     call print_tomato(0)

     if (xx/60 .lt. 10) then
        write(*, '(a9)', advance='no') '0'
        write(*, '(i1)', advance='no') xx/60
     else
        write(*, '(i10)', advance='no') xx/60
     end if

     write(*, '(a)', advance='no') ':'

     if (mod(xx,60) .lt. 10) then
        write(*, '(a1)', advance='no') '0'
        write(*, '(i1)') mod(xx,60)
     else
        write(*, '(i2)') mod(xx,60)
     end if

     call sleep(1)
     call system('clear')
  end do
end subroutine timer 

implicit none
integer :: beep, counter = 0

call system('clear')

1 if (counter .gt. 0) then
   call print_tomato(0)
   read(*,*)
   call system('clear')
   call timer(1501)
else
   call timer(1501)
end if

counter = counter + 1

call print_tomato(0)

write(*, '(a9)', advance='no') '0'
write(*, '(i0)', advance='no') counter
write(*, '(a)') '/04'

do beep=1, 10
   call system('beep')
end do

call system('clear')

if (counter .eq. 4) then
   call timer(901)
   counter = 0
else
   call timer(301)
end if
go to 1

end program
