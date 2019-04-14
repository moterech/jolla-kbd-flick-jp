Name:       jolla-kbd-flick-jp
Version:    1.0.0
Release:    1%{?dist}
Summary:    Japanese flick layout for Sailfish OS
License:    LGPLv2
Source:     %{name}.tar.gz
URL:        https://github.com/sleepsounds/jolla-kbd-flick-jp
BuildArch:  noarch
Packager:   helicalgear,knokmki612,toxip
Requires:   libanthy-qml-plugin
Requires:   patchmanager
Requires:   jolla-anthy-jp
Requires:   jolla-keyboard
Requires:   sailfish-version >= 3.0.0

%description
Allows you to type in Japanese by flick on Sailfish OS.

%define debug_package %{nil}

%prep
%setup -q -n %{name}

%build
%qmake5

%install
rm -rf %{buildroot}
%qmake5_install

%files
/usr/share/maliit/plugins/com/jolla/Flicker.qml
/usr/share/maliit/plugins/com/jolla/FlickPopper.qml
/usr/share/maliit/plugins/com/jolla/layouts/ja_10key_flick.qml
/usr/share/maliit/plugins/com/jolla/layouts/ja_10key_flick.conf
/usr/share/maliit/plugins/com/jolla/layouts/ja_10key_flick/
/usr/share/patchmanager/patches/%{name}/

%pre
if [ -d /usr/share/patchmanager/patches/%{name} ]; then
/usr/sbin/patchmanager -u %{name} || true
fi

%preun
/usr/sbin/patchmanager -u %{name} || true

%changelog
* Sun Mar 3 2019 Topias Vainio <toxip@disroot.org> 1.0.0-1
- Added assisting labels and poppers to ease users unfamiliar with flick keyboards
- Added settings entries for assist labels and poppers under text input
- Refactoring and code cleanup
