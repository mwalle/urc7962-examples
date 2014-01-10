SECTIONS
{
	. = 0xa00;
	.text :
	{
		entry.o (.text)
		*(.text)
	}
	.data : { *(.data) }
	.bss : { *(.bss) }
}
