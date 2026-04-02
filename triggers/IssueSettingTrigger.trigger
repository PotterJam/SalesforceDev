trigger IssueSettingTrigger on Issue_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueSettingHandler.handleAfterDelete(Trigger.old);
    }
}
