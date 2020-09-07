#!/usr/bin/perl -w
use strict;
my %Data=();my $Count=0;open HN, "<Gene_GO_Information_org.Hs.eg.db.txt";while(<HN>){chomp;s/"//g;next if(/^\s*SI.*/);my($GS,$GO,$TERM)=(split "\t",$_)[2,3,5];next if($GO eq "NA");$Data{$GO}{$TERM}{$GS}=1;$Count++;}close(HN);my %PERGO_TERM=(); my %PERGO_TERM_Count=();foreach my $Go(sort keys %Data){foreach my $Term(sort keys $Data{$Go}){foreach my $GS(sort keys $Data{$Go}{$Term}){if(!defined $PERGO_TERM{$Go}{$Term}){$PERGO_TERM{$Go}{$Term}=$GS}else{$PERGO_TERM{$Go}{$Term}.=";$GS";}$PERGO_TERM_Count{$Go}{$Term}++;}}}open HNS,">Table_Gene_GO_Information_org.Hs.eg.db.txt";foreach my $Go(sort keys %PERGO_TERM){foreach my $Term(sort keys $PERGO_TERM{$Go}){print HNS "$Go\t$Term\t$PERGO_TERM_Count{$Go}{$Term}\t$PERGO_TERM{$Go}{$Term}\n";}}


