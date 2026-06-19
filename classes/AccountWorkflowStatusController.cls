public with sharing class AccountWorkflowStatusController {

    @AuraEnabled
    public static Map<String, Object> getWorkflowStatus(Id accountId) {
        Map<String, Object> result = new Map<String, Object>();

        Map<String, Object> alertInfo = new Map<String, Object>();
        alertInfo.put('alertName', 'WorkflowAlert_to_test_Changed_Component');
        alertInfo.put('description', 'WorkflowAlert to test Changed Component');
        alertInfo.put('recipientType', 'Owner');
        alertInfo.put('emailTemplate', 'ContactFollowUpSAMPLE');
        result.put('alertInfo', alertInfo);

        List<Map<String, String>> activities = new List<Map<String, String>>();
        List<Task> tasks = [
            SELECT Subject, ActivityDate, Status
            FROM Task
            WHERE WhatId = :accountId
              AND Subject LIKE '%Workflow%'
            ORDER BY ActivityDate DESC
            LIMIT 10
        ];
        for (Task t : tasks) {
            Map<String, String> activity = new Map<String, String>();
            activity.put('subject', t.Subject);
            activity.put('activityDate', String.valueOf(t.ActivityDate));
            activity.put('status', t.Status);
            activities.add(activity);
        }
        result.put('activities', activities);

        return result;
    }
}
