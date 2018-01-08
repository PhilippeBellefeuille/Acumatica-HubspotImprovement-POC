<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true"
	ValidateRequest="false" CodeFile="HS503000.aspx.cs" Inherits="Page_HS503000"
	Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>
<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" TypeName="PX.Objects.HS.HubSpotSYImportProcess"
		PrimaryView="MappingsSingle">
		<CallbackCommands>
		    <px:PXDSCallbackCommand Name="Insert" PostData="Self" />
			<px:PXDSCallbackCommand CommitChanges="True" Name="Save" />
			<px:PXDSCallbackCommand Name="First" PostData="Self" StartNewGroup="True" />
			<px:PXDSCallbackCommand Name="Last" PostData="Self" />
		</CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
	<px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%"
		DataMember="MappingsSingle" Caption="Selection" FilesIndicator="True" NoteIndicator="True">
		<Template>
		    
			<px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="M" />
			<px:PXSelector runat="server" DataField="Name" AutoAdjustColumns="True"
				ID="edName" DataSourceID="ds">
				<AutoCallBack Command="Refresh" Target="form">
				</AutoCallBack>
			</px:PXSelector>
            <px:PXTextEdit ID="edScreenDescription" runat="server" DataField="ScreenDescription"></px:PXTextEdit>
			<px:PXLayoutRule runat="server" ControlSize="M" LabelsWidth="SM" StartColumn="True">
			</px:PXLayoutRule>
			<px:PXDropDown runat="server" Enabled="False" DataField="Status" AllowNull="False"
				ID="edStatus" />
			<px:PXNumberEdit runat="server" Enabled="False" DataField="NbrRecords" AllowNull="False" ID="edNbrRecords" Size="M" />
			
            <px:PXLayoutRule runat="server" ControlSize="M" LabelsWidth="SM" StartColumn="True" SuppressLabel="True" />
            <px:PXCheckBox runat="server" ID="mappingTabVisibility" DataField="IsSimpleMapping" />
            <px:PXCheckBox runat="server" ID="chkDiscardPrevious" DataField="DiscardResult" />
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
