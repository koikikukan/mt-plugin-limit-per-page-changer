package LimitPerPageChanger::CMS;
use strict;

sub display_options {
    my ($cb, $app, $tmpl) = @_;

    my $old = <<HERE;
            <select name="limit">
                <option value="25"<mt:if name="LIMIT_25"> selected="selected"</mt:if>><__trans phrase="[quant,_1,row,rows]" params="25"></option>
                <option value="50"<mt:if name="LIMIT_50"> selected="selected"</mt:if>><__trans phrase="[quant,_1,row,rows]" params="50"></option>
                <option value="100"<mt:if name="LIMIT_100"> selected="selected"</mt:if>><__trans phrase="[quant,_1,row,rows]" params="100"></option>
                <option value="200"<mt:if name="LIMIT_200"> selected="selected"</mt:if>><__trans phrase="[quant,_1,row,rows]" params="200"></option>
            </select>
HERE
    $old = quotemeta($old);

    my $new = <<HERE;
            <input type="text" name="limit" style="width:5em" value="<mt:if name="limit"><mt:var name="limit" /><mt:else>25</mt:if>" />
HERE
    $$tmpl =~ s/$old/$new/;
}

1;
