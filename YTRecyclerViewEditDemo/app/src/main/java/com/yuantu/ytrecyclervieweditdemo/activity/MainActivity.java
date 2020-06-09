package com.yuantu.ytrecyclervieweditdemo.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.yuantu.ytrecyclervieweditdemo.R;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //
        View current_view = findViewById(R.id.home_activity);
        current_view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent domainIntent = new Intent(MainActivity.this, DomainChangeActivity.class);
                startActivity(domainIntent);
            }
        });
    }
}
