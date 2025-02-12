

<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="card col-md-8" style="padding: 16px;">
        <div class="card-body">
            <h4 class="card-title">Research Projects Detail</h4>
            <p class="card-description">ข้อมูลรายละเอียดโครงการวิจัย</p>
            <div class="row">
                <p class="card-text col-sm-3"><b>ชื่อโครงการ</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->project_name); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>วันเริ่มต้นโครงการ</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->project_start); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>วันสิ้นสุดโครงการ</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->project_end); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>แหล่งทุนวิจัย</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->fund->fund_name); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>จำนวนเงิน</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->budget); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>รายละเอียดโครงการ</b></p>
                <p class="card-text col-sm-9"><?php echo e($researchProject->note); ?></p>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>สถานะโครงการ</b></p>
                <?php if($researchProject->status == 1): ?>
                <p class="card-text col-sm-9">ยื่นขอ</p>
                <?php elseif($researchProject->status == 2): ?>
                <p class="card-text col-sm-9">ดำเนินการ</p>
                <?php else: ?>
                <p class="card-text col-sm-9">ปิดโครงการ</p>
                <?php endif; ?>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>ผู้รับผิดชอบโครงการ</b></p>
                <?php $__currentLoopData = $researchProject->user; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if( $user->pivot->role == 1): ?>
                <p class="card-text col-sm-9"><?php echo e($user->position_th); ?><?php echo e($user->fname_th); ?> <?php echo e($user->fname_th); ?></p>
                <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <div class="row">
                <p class="card-text col-sm-3"><b>สมาชิกโครงการ</b></p>
                <?php $__currentLoopData = $researchProject->user; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if( $user->pivot->role == 2): ?>
                <p class="card-text col-sm-9"><?php echo e($user->position_th); ?><?php echo e($user->fname_th); ?> <?php echo e($user->fname_th); ?>

				<?php if(!$loop->last): ?>,<?php endif; ?>
                <?php endif; ?>
                
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                <?php $__currentLoopData = $researchProject->outsider; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if( $user->pivot->role == 2): ?>
                ,<?php echo e($user->title_name); ?><?php echo e($user->fname); ?> <?php echo e($user->fname); ?></p>
				<?php if(!$loop->last): ?>,<?php endif; ?>
                <?php endif; ?>
                
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <div class="pull-right mt-5">
                <a class="btn btn-primary" href="<?php echo e(route('researchProjects.index')); ?>">Back</a>
            </div>

        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('dashboards.users.layouts.user-dash-layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\653380263-0\SoftEn_Group6\git-group-repository-group-6-sec-2\InitialProject\resources\views/research_projects/show.blade.php ENDPATH**/ ?>