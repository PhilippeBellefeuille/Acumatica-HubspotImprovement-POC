<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="HS503000.aspx.cs" Inherits="Page_HS503000"
    Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>
<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" TypeName="PX.Objects.HS.HubSpotSYImportProcess"
        PrimaryView="Filter">
        <CallbackCommands>
            <px:PXDSCallbackCommand CommitChanges="True" Name="Save" />
        </CallbackCommands>
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%"
        DataMember="Filter" Caption="Selection" FilesIndicator="True" NoteIndicator="True">
        <Template>
            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="M" />
            <px:PXSelector ID="edMappingName" runat="server" DataSourceID="ds" DataField="MappingName" AutoAdjustColumns="True" CommitChanges="True" />
            <px:PXSelector ID="edHubspotList" runat="server" DataSourceID="ds" DataField="HubspotListID" AutoAdjustColumns="True" CommitChanges="True" AutoRefresh="True" />
            <px:PXLayoutRule runat="server" StartGroup="True" StartColumn="True" />
            <px:PXFormView ID="formMappingsSingle" runat="server" DataSourceID="ds" DataMember="MappingsSingle" SkinID="Transparent">
                <Template>
                    <px:PXTextEdit ID="edScreenDescription" runat="server" DataField="ScreenDescription"></px:PXTextEdit>
                </Template>
                <ContentLayout ControlSize="XM" LabelsWidth="SM" OuterSpacing="None" />
                <ContentStyle BackColor="Transparent" BorderStyle="None" />
            </px:PXFormView>
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="gridPreparedData" runat="server" DataSourceID="ds" Height="411px"
        Style="z-index: 100" Width="100%" AutoGenerateColumns="AppendDynamic" AllowPaging="True"
        AdjustPageSize="Auto" SkinID="Inquire" AutoSaveLayout="false" RepaintColumns="true" GenerateColumnsBeforeRepaint="true">
        <Mode AllowAddNew="False" AllowDelete="False" />
        <Levels>
            <px:PXGridLevel DataMember="PreparedData">
                <RowTemplate>
                    <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="M" ControlSize="XM" />
                    <px:PXLayoutRule runat="server" Merge="True" />
                    <px:PXCheckBox ID="chkIsActive" runat="server" Checked="True" DataField="IsActive" />
                    <px:PXTextEdit Size="s" ID="edErrorMessage" runat="server" DataField="ErrorMessage" AutoCallBack-Command="Refresh" AutoCallBack-Target="formOp1" />
                    <px:PXLayoutRule runat="server" Merge="False" />
                    <px:PXCheckBox ID="chkIsProcessed" runat="server" DataField="IsProcessed" />
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="MappingID" Visible="false" AllowShowHide="False" />
                    <px:PXGridColumn DataField="LineNbr" Width="50px" />
                    <px:PXGridColumn AllowNull="False" DataField="IsActive" TextAlign="Center" Type="CheckBox"
                        Width="60px" />
                    <px:PXGridColumn AllowNull="False" DataField="IsProcessed" TextAlign="Center" Type="CheckBox"
                        Width="60px" />
                    <px:PXGridColumn DataField="ErrorMessage" Width="100px" />
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <ActionBar PagerVisible="False">
        </ActionBar>
        <AutoSize MinHeight="150" Enabled="True" Container="Window" />
    </px:PXGrid>
</asp:Content>
