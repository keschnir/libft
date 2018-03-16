/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   ft_constuctors.c                                 .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: fablin <fablin@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/01/29 13:09:01 by fablin       #+#   ##    ##    #+#       */
/*   Updated: 2018/03/09 19:14:00 by fablin      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "ft_printf.h"



t_format	*ft_new_format(char *substr)
{
	t_format	*new_format;
	char		*c;

	if (!(new_format = (t_format *)malloc(sizeof(t_format))))
		return (NULL);
	ft_bzero(new_format, sizeof(t_format));
	ft_memset(new_format->flags, 1, 5);
	if (substr && *substr == '%')
	{
		c = substr + 1;
		c = ft_set_flags(c, new_format);
		c = ft_set_width(c, new_format);
		c = ft_set_preci(c, new_format);
		c = ft_set_size(c, new_format);
		c = ft_set_type(c, new_format);
	}
	else if (substr && *substr != '%')
		new_format->tostring = (wchar_t *)ft_strdup(substr);
	return (new_format);
}