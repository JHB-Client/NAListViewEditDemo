package com.yuantu.ytrecyclervieweditdemo.activity;

import android.app.Activity;
import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.yuantu.ytrecyclervieweditdemo.R;
import com.yuantu.ytrecyclervieweditdemo.adapter.DomainActivityAdapter;
import com.yuantu.ytrecyclervieweditdemo.entity.Domain;

import java.util.ArrayList;
import java.util.List;

public class DomainChangeActivity extends Activity {

    private RecyclerView my_recyclerview;
    private List dataSource;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // PS:这一步很重要
        setContentView(R.layout.activity_domain);

        // 一.视图渲染
        my_recyclerview = findViewById(R.id.my_recyclerview);
        //第一步：设置形位
        my_recyclerview.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        // 分割线
        my_recyclerview.addItemDecoration(new DividerItemDecoration(this, DividerItemDecoration.VERTICAL));
        //第二步：设置数据源和Item
        dataSource = new ArrayList();
        Domain domain = new Domain("https://router_xxxxxx.com", false);
        dataSource.add(domain);

        my_recyclerview.setAdapter(new DomainActivityAdapter(R.layout.recyclerview_my, dataSource, this));

        //二.事件处理
        //1.
        TextView btn_add = findViewById(R.id.btn_add);
        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showInputAlert();
            }
        });

    }


    private void showInputAlert() {

        final EditText inputServer = new EditText(this);
        inputServer.setHint("请输入要切换的域名");
//        inputServer.setHintTextColor();
        inputServer.setFocusable(true);
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setView(inputServer).setNegativeButton("取消", null);
        builder.setPositiveButton("确定",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        String inputName = inputServer.getText().toString();
                        Domain domain = new Domain(inputName, false);
                        dataSource.add(domain);
                    }
                });
        builder.show();
    }
}
