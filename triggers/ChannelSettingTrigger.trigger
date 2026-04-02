trigger ChannelSettingTrigger on Channel_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSettingHandler.handleAfterDelete(Trigger.old);
    }
}
