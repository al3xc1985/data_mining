﻿<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="SqlDataMining.aspx.cs" Inherits="WebApplication_OLAP.pages.SqlDataMining" %>

<%@ Register assembly="Microsoft.AnalysisServices.DataMiningHtmlViewers" namespace="Microsoft.AnalysisServices.DataMiningHtmlViewers" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Easy Data Miner</title>
    <link rel="Stylesheet" href="../style.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="content">
        <%-- Login --%>
        <div id="top_info">
            <p>
                Bine ati venit la <b>Easy Data Miner</b> <span id="loginbutton"><a href="#" title="Autentificare">
                    &nbsp;</a></span><br />
                <b>Nu sunteti autentificat!</b> <a href="#">Autentificare</a> </p>
        </div>
        <%-- Logo --%>
        <div id="logo">
            <h1>
                <a href="#" title="Noi scoatem datele la lumina.">Easy Data Miner</a></h1>
            <p id="slogan">
                Noi scoatem datele la lumina.</p>
        </div>
        <%-- Tab links --%>
        <ul id="tablist">
            <li>
                <a href="../Default.aspx" accesskey="h"><span class="key">H</span>ome </a>
            </li>
            <li>
                <a class="current" href="SqlDataMining.aspx" accesskey="m"><span class="key">M</span>ining relational </a>
            </li>
            <li>
                <a href="OlapDataMining.aspx" accesskey="o"><span class="key">M</span>ining OLAP </a>
            </li>
            <li>
                <a href="SqlReporting.aspx" accesskey="e"><span class="key">R</span>aportare relationala </a>
            </li>
            <li>
                <a href="OlapReporting.aspx" accesskey="r"><span class="key">R</span>aportare OLAP </a>
            </li>
        </ul>
        <%-- Topic list --%>
        <div id="topics">
            <div class="thirds">
                <p>
                    <br />
                    Anunturi importante:</p>
            </div>
            <div class="thirds">
                <ul>
                    <li><a href="http://dataminingarticles.com/data-mining-classification.html">
                        Data Mining Classification</a></li>
                    <li><a href="http://www.nag.co.uk/IndustryArticles/DMinFinancialApps.pdf">
                        Data Mining in financial applications</a></li>
                </ul>
            </div>
            <div class="thirds">
                <ul>
                    <li><a href="http://www.nag.co.uk/IndustryArticles/UnleashingDMpotential.pdf">
                        Data Mining full potential</a></li>
                    <li><a href="http://www.dataminingarticles.com/Grab-Bag-Frequently-Asked-Data-Mining-Questions.html">
                        FAQ</a></li>
                </ul>
            </div>
        </div>
        <%-- Search form --%>
        <div id="search">
            <form method="post" action="?">
            <p>
                <input type="text" name="search" class="search" />
                <input type="submit" value="Search" class="button" /></p>
            </form>
        </div>
        <div id="left">
            <%-- Content Area --%>
            <div class="subheader">
                <p>
                    <asp:Button ID="ButtonResult" runat="server" OnClick="Button2_Click" Text="Afiseaza continutul structurii" />
                    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    <asp:DropDownList ID="DropDownListStructures" runat="server">
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:Button ID="ButtonCreate" runat="server" OnClick="Button1_Click" Text="Creaza structura de mining cu numele:" />
                    &nbsp &nbsp &nbsp
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                    &nbsp &nbsp &nbsp
                    <asp:Label ID="LabelStatus" runat="server" Text="Rezultatul procesului:"></asp:Label></p>
            </div>
            <div class="left_articles">
                <h2>
                    Rezultatele procesului de mining</h2>
                <p class="date">
                    6th June 2011</p>
                <div style="width: 600px; height: 230px; overflow: auto;">
                    <asp:GridView ID="GridViewResults" runat="server" OnRowCommand="GridViewResults_RowCommand" Height="225px" Width="595px">
                        <Columns>
                            <asp:TemplateField HeaderText="View Node">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonNode" runat="server" CommandName="NodeView" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">View Node</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="left_articles">
            <h2>
                    Rezultatele detaliate</h2>
                <div style="width: 600px; height: 230px; overflow: auto;">
                    <asp:Panel ID="PanelViewer" runat="server" Height="225px" Width="595px">
                    </asp:Panel>
                    <asp:GridView ID="GridViewDistribution" runat="server" Height="150px" Width="595px"
                        Visible="false">
                    </asp:GridView>
                </div>
            </div>
            <div class="left_box">
                <p>
                    Pentru interogari complexe va rugam sa folositi casuta de mai jos: &nbsp &nbsp &nbsp
                    <asp:Button ID="ButtonQuery" runat="server" Text="Executa interogarea" OnClick="ButtonQuery_Click" />
                </p>
                <asp:TextBox ID="TextBoxQuery" runat="server" Height="70px" TextMode="MultiLine"
                    Width="600px"></asp:TextBox>
            </div>
            <%-- Downpage boxes
            <div class="thirds">
                <p></p>
            </div>
            <div class="thirds">
                <p></p>
            </div>
            <div class="thirds">
                <p></p>
            </div> --%>
        </div>
        <%-- Right Side --%>
        <div id="right">
            <div class="right_articles">
                <p>Selecteaza algoritmul
                </p>
                <asp:DropDownList ID="DropDownListAlgorithm" runat="server">
                    <asp:ListItem>Clustering</asp:ListItem>
                    <asp:ListItem>Decision Trees</asp:ListItem>
                    <asp:ListItem>Naive Bayes</asp:ListItem>
                    <%--<asp:ListItem>Time Series</asp:ListItem>--%>
                </asp:DropDownList>
                <p>Selecteaza tabelul cu datele de intrare</p>
                <asp:DropDownList ID="DropDownListTables" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownListTables_SelectedIndexChanged">
                </asp:DropDownList>
                <p>Selecteaza coloana cheie</p>
                <asp:DropDownList ID="DropDownListKey" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownListKey_SelectedIndexChanged">
                    </asp:DropDownList>
            </div>
            <div class="right_articles">
                <p>
                    Selecteaza coloanele de intrare:
                    <br />
                    <asp:Button ID="ButtonInput" runat="server" Text="Check All" OnClick="ButtonInput_Click" />
                </p>
                <div style="width: 250px; height: 190px; overflow: auto;">
                    <asp:CheckBoxList ID="CheckBoxListInputColumns" runat="server">
                    </asp:CheckBoxList>
                </div>
            </div>
            <div class="right_articles">
                <p>
                    Selecteaza coloanele de predictie:
                    <br />
                    <asp:Button ID="ButtonPredict" runat="server" Text="Check All" OnClick="ButtonPredict_Click" />
                </p>
                <div style="width: 250px; height: 190px; overflow: auto;">
                    <asp:CheckBoxList ID="CheckBoxListPredictColumns" runat="server">
                    </asp:CheckBoxList>
                </div>
            </div>
            <div class="notes">
                <p>
                    If you liked this template you might like some other CSS templates from <a href="http://www.solucija.com/">
                        Solucija</a>.</p>
            </div>
        </div>
        <%-- Footer --%>
        <div id="footer">
            <p class="right">
                &copy; 2011 Easy Data Mining, Design: Radu Cantor, <a title="Awsome Web Templates"
                    href="http://www.solucija.com/">Solucija</a></p>
            <p>
                <a href="#">RSS Feed</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Accessibility</a>
                &middot; <a href="#">Products</a> &middot; <a href="#">Disclaimer</a> &middot; <a
                    href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> and <a href="http://validator.w3.org/check?uri=referer">
                        XHTML</a><br />
            </p>
        </div>
    </div>
    </form>
</body>
</html>
