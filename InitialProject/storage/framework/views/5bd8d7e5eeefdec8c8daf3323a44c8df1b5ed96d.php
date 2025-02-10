

<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="card" style="padding: 16px;">
        <div class="card-body">
            <h4 class="card-title">รายละเอียดงานวารสาร</h4>
            <p class="card-description">ข้อมูลรายละเอียดวารสาร
            <div class="row mt-3">
                <p class="card-text col-sm-3"><b>ชื่อเรื่อง</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_name); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>Abstract</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->abstract); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>Keyword</b></p>
                <p class="card-text col-sm-9">
                    <?php echo e($paper->keyword); ?>

                </p>


                <!-- <p class="card-text col-sm-9"><?php echo e($paper->keyword); ?></p> -->
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ประเภทวารสาร</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_type); ?></p>
            </div>

            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ประเภทเอกสาร</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_subtype); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>Publication</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->publication); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ผู้เขียน</b></p>
                <p class="card-text col-sm-9">

                    <?php $__currentLoopData = $paper->author; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 1): ?>
                    <b>First Author:</b> <?php echo e($teacher->author_fname); ?> <?php echo e($teacher->author_lname); ?> <br>
                    <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php $__currentLoopData = $paper->teacher; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 1): ?>
                    <b>First Author:</b> <?php echo e($teacher->fname_en); ?> <?php echo e($teacher->lname_en); ?> <br>
                    <?php endif; ?> 
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    <?php $__currentLoopData = $paper->author; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 2): ?>
                    <b>Co Author:</b> <?php echo e($teacher->author_fname); ?> <?php echo e($teacher->author_lname); ?> <br>
                    <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php $__currentLoopData = $paper->teacher; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 2): ?>
                    <b>Co Author:</b> <?php echo e($teacher->fname_en); ?> <?php echo e($teacher->lname_en); ?> <br>
                    <?php endif; ?> 
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    <?php $__currentLoopData = $paper->author; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 3): ?>
                    <b>Corresponding Author:</b> <?php echo e($teacher->author_fname); ?> <?php echo e($teacher->author_lname); ?> <br>
                    <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php $__currentLoopData = $paper->teacher; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($teacher->pivot->author_type == 3): ?>
                    <b>Corresponding Author:</b> <?php echo e($teacher->fname_en); ?> <?php echo e($teacher->lname_en); ?> <br>
                    <?php endif; ?> 
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    



                </p>
            </div>

            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ชื่องานวารสาร (sourcetitle)</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_sourcetitle); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ปีที่ตีพิมพ์</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_yearpub); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>เล่มที่ (volume)</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_volume); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>ฉบับที่ (ISSUE)</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_issue); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>เลขหน้า</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_page); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>DOI</b></p>
                <p class="card-text col-sm-9"><?php echo e($paper->paper_doi); ?></p>
            </div>
            <div class="row mt-2">
                <p class="card-text col-sm-3"><b>URL</b></p>
                <a href="<?php echo e($paper->paper_url); ?>" target="_blank" class="card-text col-sm-9"><?php echo e($paper->paper_url); ?></a>
            </div>

            <a class="btn btn-primary mt-5" href="<?php echo e(route('papers.index')); ?>"> Back</a>
        </div>
    </div>

</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('dashboards.users.layouts.user-dash-layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\653380263-0\SoftEn_Group6\git-group-repository-group-6-sec-2\InitialProject\resources\views/papers/show.blade.php ENDPATH**/ ?>