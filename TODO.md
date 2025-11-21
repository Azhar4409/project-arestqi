# TODO: Fix All Bugs in Flutter Project

## Steps to Complete

1. **Edit lib/detail_page.dart**
   - Replace 'primary' with 'backgroundColor' in ElevatedButton.styleFrom (line ~116)

2. **Edit lib/sign_in_page.dart**
   - Replace 'primary' with 'backgroundColor' in ElevatedButton.styleFrom (line ~68)
   - Replace 'primary' with 'foregroundColor' in OutlinedButton.styleFrom (line ~132)

3. **Edit lib/sign_up_page.dart**
   - Replace 'primary' with 'backgroundColor' in ElevatedButton.styleFrom (line ~116)
   - Replace 'onPrimary' with 'foregroundColor' in ElevatedButton.styleFrom (line ~117)

4. **Edit test/widget_test.dart**
   - Remove 'const' from 'const MyApp()' (line ~16)

5. **Verify Fixes**
   - Run `flutter analyze` to confirm all errors are resolved
