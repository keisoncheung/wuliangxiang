lang = new Object();

lang["en"] = new Object();
lang["en"]["@@{color}"] = "Color";
lang["en"]["@@{palette}"] = "Palette";
lang["en"]["@@{16colors}"] = "16 colors(W3C)";
lang["en"]["@@{140colors}"] = "140 named colors";
lang["en"]["@@{216colors}"] = "216 safe colors";
lang["en"]["@@{syscolors}"] = "system colors";
lang["en"]["@@{custompalette}"] = "Custom Palette";
lang["en"]["@@{add}"] = "add";
lang["en"]["@@{remove}"] = "remove";
lang["en"]["@@{sort}"] = "sort";
lang["en"]["@@{reverse}"] = "reverse";
lang["en"]["@@{selectedcolor}"] = "Selected Color";
lang["en"]["@@{exact}"] = "Exact";
lang["en"]["@@{safe}"] = "Safe";
lang["en"]["@@{more}"] = "More Colors >>";
lang["en"]["@@{ok}"] = "ok";
lang["en"]["@@{cancel}"] = "cancel";
lang["en"]["@@{value}"] = "Value";
lang["en"]["@@{name}"] = "Name";
lang["en"]["@@{model}"] = " Model";
lang["en"]["@@{red}"] = "Red";
lang["en"]["@@{green}"] = "Green";
lang["en"]["@@{blue}"] = "Blue";
lang["en"]["@@{hue}"] = "Hue";
lang["en"]["@@{saturation}"] = "Saturation";
lang["en"]["@@{brightness}"] = "Brightness";
lang["en"]["@@{browserversionerror}"] = "This dialogbox is only available as of Microsoft Internet Explorer 5.0.\nPlease update your browser before you open this dialog.";
lang["en"]["@@{openerror}"] = "This page is a dialogbox, please use showModalDialog or showModelessDialog method to open it.";

lang["zh-cn"] = new Object();
lang["zh-cn"]["@@{color}"] = "��ɫ";
lang["zh-cn"]["@@{palette}"] = "��ɫ��";
lang["zh-cn"]["@@{16colors}"] = "16ɫ��W3C��";
lang["zh-cn"]["@@{140colors}"] = "140������ɫ";
lang["zh-cn"]["@@{216colors}"] = "216�ְ�ȫɫ";
lang["zh-cn"]["@@{syscolors}"] = "ϵͳ��ɫ";
lang["zh-cn"]["@@{custompalette}"] = "�Զ����ɫ��";
lang["zh-cn"]["@@{add}"] = "���";
lang["zh-cn"]["@@{remove}"] = "ɾ��";
lang["zh-cn"]["@@{sort}"] = "����";
lang["zh-cn"]["@@{reverse}"] = "��ת";
lang["zh-cn"]["@@{selectedcolor}"] = "��ѡɫ";
lang["zh-cn"]["@@{exact}"] = "׼ȷɫ";
lang["zh-cn"]["@@{safe}"] = "��ȫɫ";
lang["zh-cn"]["@@{more}"] = "�������ɫ >>";
lang["zh-cn"]["@@{ok}"] = "ȷ��";
lang["zh-cn"]["@@{cancel}"] = "ȡ��";
lang["zh-cn"]["@@{value}"] = "��ɫֵ";
lang["zh-cn"]["@@{name}"] = "����";
lang["zh-cn"]["@@{model}"] = "��ɫģ��";
lang["zh-cn"]["@@{red}"] = "��ɫ����";
lang["zh-cn"]["@@{green}"] = "��ɫ����";
lang["zh-cn"]["@@{blue}"] = "��ɫ����";
lang["zh-cn"]["@@{hue}"] = "ɫ��";
lang["zh-cn"]["@@{saturation}"] = "���Ͷ�";
lang["zh-cn"]["@@{brightness}"] = "����";
lang["zh-cn"]["@@{browserversionerror}"] = "�˶Ի���ֻ������ Microsoft Internet Explorer 5.0 ������߰汾�������\n������������������ٴ򿪴˶Ի���";
lang["zh-cn"]["@@{openerror}"] = "��ҳΪ�Ի�������showModalDialog��showModelessDialog�����򿪡�";

function getlocal(langcode, str) {
  return str.replace(str.match(/(@@{\w+})/g), lang[langcode][str.match(/(@@{\w+})/g)]);
}

function setlocal(langcode, items, attribute) {
  for(i = 0; i < items.length; i++) eval("items[i]." + attribute + " = getlocal(langcode, items[i]." + attribute + ");");
}

function setlanguage(langcode) {
  document.title = getlocal(langcode, document.title);
  setlocal(langcode, document.getElementsByTagName("legend"), "innerText");
  setlocal(langcode, document.getElementsByTagName("label"), "innerText");
  setlocal(langcode, document.getElementsByTagName("option"), "text");
  setlocal(langcode, document.getElementsByTagName("input"), "value");
}

var langcode = navigator.userLanguage;
if (langcode != "zh-cn") langcode = "en";
setlanguage(langcode);
