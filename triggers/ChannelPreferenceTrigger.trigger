trigger ChannelPreferenceTrigger on Channel_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
