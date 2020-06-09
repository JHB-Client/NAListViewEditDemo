package com.yuantu.ytrecyclervieweditdemo.adapter;
import android.content.Context;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.viewholder.BaseViewHolder;
import com.yuantu.ytrecyclervieweditdemo.R;
import com.yuantu.ytrecyclervieweditdemo.entity.Domain;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.List;


public class DomainActivityAdapter extends BaseQuickAdapter<Domain, BaseViewHolder> {

    private Context context; // 手动创建的参数
    public DomainActivityAdapter(int layoutResId, @Nullable List<Domain> data, Context context) {
        super(layoutResId, data);
        this.context = context;
    }

    @Override
    protected void convert(@NotNull BaseViewHolder baseViewHolder, Domain domain) {
        BaseViewHolder baseVH = baseViewHolder.setText(R.id.domain_name, domain.getName());
        if (domain.isState() == true) {
            baseVH.setText(R.id.domain_state, "在使用");
        } else {
            baseVH.setText(R.id.domain_state, "未使用");
        }
    }


}
