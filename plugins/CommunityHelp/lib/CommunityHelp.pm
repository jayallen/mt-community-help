package CommunityHelp;

sub add_link {
    my ($cb, $app, $tmplref, $template_name) = @_;

    my $help_url = $app->config->ErrorHelpURL || $app->help_url;
    $help_url =~ s{/$}{}g;

    $$tmplref =~  s{
                        (
                            <mt:var\sname="error">
                        )
                    }{
                        $1 
                        (<a href="${help_url}<mt:var name="error" escape="url">">Huh?</a>)
                    }x;
}

1;
