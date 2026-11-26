package com.kronowjj.redfruittv;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
    private final int background = Color.rgb(17, 15, 24);
    private final int accent = Color.rgb(255, 91, 72);

    @Override
    public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().getDecorView().setSystemUiVisibility(
            View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
            View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
        );
        showHome();
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private void showHome() {
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(background);
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(56, 36, 56, 36);
        scroll.addView(page);

        TextView logo = text("红果漫剧 TV", 34, Color.WHITE);
        logo.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        page.addView(logo);

        TextView subtitle = text("为 Sony BRAVIA 大屏与遥控器设计", 17, 0xFFBDB7C8);
        LinearLayout.LayoutParams subParams = new LinearLayout.LayoutParams(-2, -2);
        subParams.topMargin = 8;
        page.addView(subtitle, subParams);

        TextView section = text("精选漫剧", 23, Color.WHITE);
        LinearLayout.LayoutParams sectionParams = new LinearLayout.LayoutParams(-2, -2);
        sectionParams.topMargin = 34;
        page.addView(section, sectionParams);

        String[] dramas = {"示例漫剧 · 逆袭人生", "示例漫剧 · 都市奇缘", "示例漫剧 · 玄幻世界"};
        for (int i = 0; i < dramas.length; i++) {
            final String title = dramas[i];
            Button item = new Button(this);
            item.setText(title + "     ›");
            item.setTextSize(19);
            item.setTextColor(Color.WHITE);
            item.setAllCaps(false);
            item.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            item.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xFF302A3A));
            item.setFocusable(true);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(620, 76);
            params.topMargin = 14;
            page.addView(item, params);
            item.setOnClickListener(v -> showDetail(title));
        }

        TextView note = text("当前为电视端基础版本。真实红果内容与播放需要平台授权接口。", 14, 0xFFAAA3B4);
        LinearLayout.LayoutParams noteParams = new LinearLayout.LayoutParams(-2, -2);
        noteParams.topMargin = 30;
        page.addView(note, noteParams);

        setContentView(scroll);
    }

    private void showDetail(String title) {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setGravity(Gravity.CENTER_VERTICAL);
        page.setPadding(72, 48, 72, 48);
        page.setBackgroundColor(background);

        TextView heading = text(title, 30, Color.WHITE);
        heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        page.addView(heading);

        TextView description = text("剧情简介与剧集信息将在接入合法内容数据后显示。", 18, 0xFFCEC8D5);
        LinearLayout.LayoutParams d = new LinearLayout.LayoutParams(-2, -2);
        d.topMargin = 20;
        page.addView(description, d);

        Button play = new Button(this);
        play.setText("播放");
        play.setAllCaps(false);
        play.setTextSize(20);
        play.setFocusable(true);
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(260, 72);
        p.topMargin = 32;
        page.addView(play, p);
        play.setOnClickListener(v -> Toast.makeText(this,
            "尚未接入红果官方授权播放源，暂不能播放真实剧集。", Toast.LENGTH_LONG).show());

        Button back = new Button(this);
        back.setText("返回首页");
        back.setAllCaps(false);
        back.setFocusable(true);
        LinearLayout.LayoutParams b = new LinearLayout.LayoutParams(260, 64);
        b.topMargin = 12;
        page.addView(back, b);
        back.setOnClickListener(v -> showHome());
        setContentView(page);
        play.requestFocus();
    }
}
