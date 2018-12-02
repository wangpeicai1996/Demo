package com.pcwang.job;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

/**
 * ����������
 * @author Administrator
 *
 */
public class Main {

	public static void main(String[] args) throws SchedulerException {
		//1.����Job������Ҫ��ʲô�£�
		JobDetail job = JobBuilder.newJob(MyJob.class).build();
		//2.����Trigger������ʲôʱ������
		/**
		 * �򵥵�tirgger����ʱ�䣺ͨ��Quartz�ṩ��һЩ��������ɼ򵥵��ظ�����
		 * cron���ʽ����ʱ�䣺����cron���ʽ��������ʱ��
		 */
		//��trigger
		Trigger trigger1 = TriggerBuilder.newTrigger().withSchedule(SimpleScheduleBuilder.repeatSecondlyForever()).build();
		//cron���ʽtrigger
		Trigger trigger2 = TriggerBuilder.newTrigger().withSchedule(CronScheduleBuilder.cronSchedule("0/2 * * * * ?")).build();

		//3.����Scheduler����ʲôʱ����ʲô��?
		Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
		scheduler.scheduleJob(job,trigger2);
		//��������
		scheduler.start();
	}
}
